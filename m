From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] drivers, char: add U-Boot bootcount driver
Date: Mon, 30 Jan 2012 13:35:45 +0100
Message-ID: <4F268EA1.3090907@denx.de>
References: <1322991921-21096-1-git-send-email-hs@denx.de>
 <20111204114741.GA5788@pengutronix.de> <4EDCD7B2.5030409@denx.de>
 <20111206215056.GD14154@pengutronix.de>
 <20111206215609.5D1FF1A32820@gemini.denx.de>
 <20111206220620.GF14154@pengutronix.de> <4EDEA3BF.6020507@gmail.com>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <4EDEA3BF.6020507-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vitaly Bordug <vbordug-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Rob,

Sorry for the late reply ...

Rob Herring wrote:
> On 12/06/2011 04:06 PM, Wolfram Sang wrote:
>>>> bootcount itself is not a device. It is a feature of certain devices. And that
>>>> needs to be implemented; possibly generic enough that it can work for register
>>>> based, i2c based, and so forth, accesses.
>>> If "boot counter" is not a good name for such a device, then what name
>>> would you suggest?
>> None.
>>
>>> Or do you think a counter (which can be implemented in a number of
>>> different ways, depending on hardware specifics) is not a device?
>> Yes.
>>
>>> What would be such a device, then?
>> "maxim,ds1338"
>>
>> Please have a look at the devicetree.org-wiki-page I just mentioned:
>>
>> http://devicetree.org/Device_Tree_Usage
>>
> 
> Perhaps fs/pstore would be a good choice for the user space interface
> (defining a new file bootcount). This can support any arbitrary backing
> device although pretty much only ACPI is implemented.

I tried to use fs/pstore for the bootcount feature, and I can mount
and read the bootcount value from the file, I created. But I could not
write to that file ... I only see the callback from
include/linux/pstore.h

struct pstore_info {
[...]
        int             (*write)(enum pstore_type_id type,
                        enum kmsg_dump_reason reason, u64 *id,
                        unsigned int part, size_t size, struct pstore_info *psi);

called, if I reboot ... do I miss something? Or is it not possible
to write to the files created through fs/pstore?

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
