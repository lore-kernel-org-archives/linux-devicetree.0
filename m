From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: vf610: Add SoC bus support for Vybrid
Date: Wed, 20 May 2015 09:36:38 +0200
Message-ID: <61cec15fe896133ee6e102b0242fb43d@agner.ch>
References: <cover.1432099651.git.maitysanchayan@gmail.com>
 <27733a88b73adb7000205e020bafdb6f7ebe1843.1432099651.git.maitysanchayan@gmail.com>
 <9691074.oWRy1bscbz@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9691074.oWRy1bscbz@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015-05-20 09:12, Arnd Bergmann wrote:
> On Wednesday 20 May 2015 11:06:52 Sanchayan Maity wrote:
>> Implements SoC bus support to export SoC specific information. Read
>> the unique SoC ID from the Vybrid On Chip One Time Programmable
>> (OCOTP) controller, SoC specific information from the Miscellaneous
>> System Control Module (MSCM), revision from the ROM revision register
>> and expose it via the SoC bus infrastructure.
>>
>> Sample Output:
>>
>> root@vf:/sys/devices/soc0# cat soc_id
>> df63c12a2e2161d4
>> root@vf:/sys/devices/soc0# cat family
>> Freescale Vybrid VF500
>> root@vf:/sys/devices/soc0# cat revision
>> 00000013
>> root@vf:/sys/devices/soc0# cat machine
>> Freescale Vybrid
>>
> 
> I would prefer to see this as a driver in drivers/soc that registers
> to a platform device. Is there any DT node that would be a reasonable
> device to bind to?

Hm, what is a viable device? Probably the most SoC specific device in
the SoC? Currently, all three devices we read from do have a
vf610-something compatible string, hence would be SoC specific (ocotp,
ocrom and mscm-cpucfg). Probably the last is the most SoC specific...

But somehow bind to just a random device sounds wrong to me. Couldn't we
add a more specific compatible string to the soc node and bind to that?

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
