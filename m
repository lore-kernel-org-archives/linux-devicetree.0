From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 5/8] net: mscc: Add initial Ocelot switch support
Date: Sat, 31 Mar 2018 15:47:27 -0700
Message-ID: <244d3f20-f8f8-d9a2-a6b5-1a8fa4f0b655@gmail.com>
References: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
 <20180323201117.8416-6-alexandre.belloni@bootlin.com>
 <1df0a932-f7c1-f1b5-9a35-3c16d0c551e5@gmail.com>
 <20180330124537.GC14180@piout.net> <20180330135422.GA28244@lunn.ch>
 <20180330141634.GD14180@piout.net> <20180330145008.GE28244@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180330145008.GE28244@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "David S . Miller" <davem@davemloft.net>, Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Le 03/30/18 à 07:50, Andrew Lunn a écrit :
> On Fri, Mar 30, 2018 at 04:16:34PM +0200, Alexandre Belloni wrote:
>> On 30/03/2018 at 15:54:22 +0200, Andrew Lunn wrote:
>>>>> All of this sounds like it should be moved into the br_join/leave, this
>>>>> does not appear to be the right place to do that.
>>>>>
>>>>
>>>> No, I've triple checked because this is a comment that both Andrew and
>>>> you had. Once a port is added to the PGID MASK, it will start forwarding
>>>> frames so we really want that to happen only when the port is in
>>>> BR_STATE_FORWARDING state. Else, we may forward frames between the
>>>> addition of the port to the bridge and setting the port to the
>>>> BR_STATE_BLOCKING state.
>>>
>>> Hi Alexandre
>>>
>>> Interesting observation. I took a look at some of the other join
>>> implementations. mv88e6xxx does the join immediately. mt7539 does it
>>> immediately, if the port is enabled. lan9303 does it immediately.
>>> qca8k does it immediately. b53 does it immediately.
>>>
>>
>> I had a look at b53, my impression was that b53_br_join() adds the port
>> to the bridge but b53_br_set_stp_state() actually enables forwarding. So
>> as long as the default on the port is PORT_CTRL_DIS_STATE, the port will
>> not be forwarding frames. And this is the case because b53_enable_port()
>> does put 0 in B53_PORT_CTRL.
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/net/dsa/b53/b53_regs.h#L71
> 
> It seems like, 0 means no STP at all. Which to me would mean, forward
> all packets. But i could be wrong. Florian?

Correct, 0 disables STP and therefore means forward all packets.

> 
>> The fact is that ocelot doesn't have separate controls. The port is
>> either forwarding or not. If it is not forwarding, then there is nothing
>> to tell the HW to do.
> 
> Think about the following sequence:
> 
> ip link set lan0 up
> 
> After this command, i expect to see packets on lan0 arrive at the
> host, tcpdump to work, etc. This probably means the port is in
> 'forwarding' mode, or for B53, STP is disabled.

In net/dsa/port.c::dsa_port_enable we have the following:

u8 stp_state = dp->bridge_dev ? BR_STATE_BLOCKING : BR_STATE_FORWARDING;

> 
> ip link add name br0 type bridge
> ip link set dev br0 up
> ip link set dev lan0 master br0
> 
> When the port is added to the bridge, there is a window of time
> between the join and the STP change to blocking/learning, when the
> port is in forwarding mode. You avoid this window. But the other
> drivers don't appear to.
> 
> So i would like to fix this of every driver. I'm not sure how yet...

Agreed, there does appear to be a window like you outlined in your
example if the port was already UP where we may be in an inconsistent
STP state. This window does not appear to be existing in case the port
was not UP prior to joining the bridge though.

It seems to me like the most natural place where to fix this would be in
the bridge code, but this has the potential to break several drivers so
within the scope of DSA, it might be as simple as this:

diff --git a/net/dsa/port.c b/net/dsa/port.c
index 7acc1169d75e..e692b6f1a710 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -116,6 +116,8 @@ int dsa_port_bridge_join(struct dsa_port *dp, struct
net_device *br)
        if (err)
                dp->bridge_dev = NULL;

+       dsa_port_set_state_now(dp, BR_STATE_BLOCKING);
+
        return err;
 }
-- 
Florian
