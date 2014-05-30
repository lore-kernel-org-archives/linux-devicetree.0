From: Jonas Bonn <jonas@southpole.se>
Subject: Re: [PATCH v4] openrisc: irq: use irqchip framework
Date: Fri, 30 May 2014 13:08:10 +0200
Message-ID: <5388669A.2090807@southpole.se>
References: <1401136302-27654-1-git-send-email-stefan.kristiansson@saunalahti.fi>
	<CAMuHMdUUqaRP2M0hPh5k0nPp1a_t0W98Vc_4zAQMjGYZZOPd8w@mail.gmail.com>
	<53843508.7060007@southpole.se>
	<20140529202806.GA9387@chokladfabriken.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <20140529202806.GA9387@chokladfabriken.org>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux <linux@lists.openrisc.net>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 05/29/2014 10:28 PM, Stefan Kristiansson wrote:
> On Tue, May 27, 2014 at 08:47:36AM +0200, Jonas Bonn wrote:
>> On 05/26/2014 10:52 PM, Geert Uytterhoeven wrote:
>>> CC devicetree for the bindings
>>>
>>> On Mon, May 26, 2014 at 10:31 PM, Stefan Kristiansson
>>> <stefan.kristiansson@saunalahti.fi> wrote:
>>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/opencores,or1k-pic.txt
>>>> @@ -0,0 +1,23 @@
>>>> +OpenRISC 1000 Programmable Interrupt Controller
>>>> +
>>>> +Required properties:
>>>> +
>>>> +- compatible : should be "opencores,or1k-pic-level" for variants with
>>>> +  level triggered interrupt lines, "opencores,or1k-pic-edge" for variants with
>>>> +  edge triggered interrupt lines or "opencores,or1200-pic" for machines
>>>> +  with the non-spec compliant or1200 type implementation.
>>>> +
>>>> +  "opencores,or1k-pic" is also provided as an alias to "opencores,or1200-pic",
>>>> +  but this is only for backwards compatibility.
>>
>> I still think this identifier needs to be versioned.  Use the same
>> version number as we have on the cpu identifier since the OR1200 PIC
>> hasn't changed since then; i.e. opencores,or1200-pic-rtlsvnXYZ.
>>
> 
> I can change that if you *really* insist on it...
> But I don't understand the purpose of the versioning here,
> there will never be any other or1200-pic version than the one that currently
> exists, so IMO "or1200" should be enough versioning information.

Famous last words... ;)

It has been insisted upon earlier by upstream; for example, when we
submitted the openrisc architecture.  Aside from that, I am not the one
who is going to be doing any insisting here.

That said, given that this is a soft core CPU and what that entails, I
do think it is probably a good idea to version this thing.

Hopefully you will get some sage advice from someone else here...
otherwise, you may do as you see fit.

Your patch is otherwise fine by me and your effort here is much appreciated!

Acked-by: Jonas Bonn <jonas@southpole.se>

/Jonas
