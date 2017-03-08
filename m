From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 1/3] usb: orion-echi: Add support for the Armada 3700
Date: Wed, 08 Mar 2017 18:21:42 +0100
Message-ID: <87shmnlm55.fsf@free-electrons.com>
References: <20170308162423.25553-1-gregory.clement@free-electrons.com>
 <20170308162423.25553-2-gregory.clement@free-electrons.com>
 <20170308165635.GB32355@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170308165635.GB32355@lunn.ch> (Andrew Lunn's message of "Wed,
 8 Mar 2017 17:56:35 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, jinghua <jinghua@marvell.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Andrew,
 
 On mer., mars 08 2017, Andrew Lunn <andrew@lunn.ch> wrote:

> Hi Gregory
[...]

Thanks for your comments I will fix the typos and the wording.



>> +#define USB_SBUSCFG		0x90
>> +#define	    USB_SBUSCFG_BAWR	    0x6
>> +#define	    USB_SBUSCFG_BARD	    0x3
>> +#define	    USB_SBUSCFG_AHBBRST	    0x0
>
> These three are all shifts. So i would suggest adding _SHIFT to the
> end.

Actually I removed it to fit in the 80 character...

>
>> +
>> +/* BAWR = BARD = 3 : Align read/write bursts packets larger than 128 bytes */
>> +#define USB_SBUSCFG_BAWR_ALIGN_128B	0x3
>> +#define USB_SBUSCFG_BARD_ALIGN_128B	0x3
>> +/* AHBBRST = 3	   : Align AHB Burst to INCR16 (64 bytes) */
>> +#define USB_SBUSCFG_AHBBRST_INCR16	0x3
>
> You can then apply the shift here.

... but I didn't think to this trick. 

>
>> +
>> +#define USB_SBUSCFG_DEF_VAL ((USB_SBUSCFG_BAWR_ALIGN_128B << USB_SBUSCFG_BAWR) \
>> +		     | (USB_SBUSCFG_BARD_ALIGN_128B << USB_SBUSCFG_BARD) \
>> +		     | (USB_SBUSCFG_AHBBRST_INCR16 << USB_SBUSCFG_AHBBRST))
>
> and this is then shorted.

So I will do it in the v2.

Thanks

Gregory

>
>     Andrew

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
