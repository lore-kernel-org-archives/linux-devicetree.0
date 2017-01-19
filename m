From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v3 0/8] ARM: dts: Switch to new DSA binding
Date: Thu, 19 Jan 2017 23:48:33 +0100
Message-ID: <878tq67jjy.fsf@free-electrons.com>
References: <20170117182224.32212-1-f.fainelli@gmail.com>
 <633afd2c-75e4-adeb-f3a0-b59b5f47f1a7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <633afd2c-75e4-adeb-f3a0-b59b5f47f1a7@gmail.com> (Florian
 Fainelli's message of "Thu, 19 Jan 2017 14:26:21 -0800")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, vivien.didelot@savoirfairelinux.com, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Florian,
 
 On jeu., janv. 19 2017, Florian Fainelli <f.fainelli@gmail.com> wrote:

> On 01/17/2017 10:22 AM, Florian Fainelli wrote:
>> Hi all,
>> 
>> This patch series converts the in-tree users to utilize the new (relatively)
>> DSA binding that was introduced with commit 8c5ad1d6179d ("net: dsa: Document
>> new binding"). The legacy binding node is kept included, but is marked
>> disabled.
>> 
>> Changes in v3:
>> 
>> - collected tags from Andrew and Russell
>> - added missing change to arch/arm/boot/dts/kirkwood-rd88f6281-a.dts
>> 
>> Changes in v2:
>> 
>> - patch 1: Use an hexadecimal reg property
>> - patch 2: fixed the subject
>> - patch 3: s/okay/disabled/ for the legacy DSA node
>> - patches 7/8: fixed a stray whitespace
>> 
>> In about 2-3 releases we may consider removing the old DSA binding entirely
>> from the kernel.
>
> Gregory, all patches have been reviewed/tested now, can you take this
> for an upcoming 4.11 pull request? Thanks!


All the series applied on mvebu/dt

Thanks,

Gregory


> -- 
> Florian

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
