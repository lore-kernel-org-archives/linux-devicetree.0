From: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 03/10] Documentation/dts: Add bindings for QIXIS FPGA
 controller found on FSL boards
Date: Wed, 9 Sep 2015 18:38:59 -0500
Message-ID: <CADRPPNTDPBHR8S4mkT0CzO4jF0sncruZkMdir6OhrdkU6Za2OQ@mail.gmail.com>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
	<1441349872-4560-4-git-send-email-bhupesh.sharma@freescale.com>
	<CADRPPNR11BD4WfXTWoQ28rZCd_BJuhdWu49E6jjpO29CH2s5Ow@mail.gmail.com>
	<BY1PR0301MB1303E56B5462BCD0C77C7E4D82570@BY1PR0301MB1303.namprd03.prod.outlook.com>
	<CADRPPNQFxqNqgvrL9eVhaDX-SYRJxmGDd87zu_XHDHY6afiu3g@mail.gmail.com>
	<BY1PR0301MB130339BD3B988DC938AA524482560@BY1PR0301MB1303.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BY1PR0301MB130339BD3B988DC938AA524482560-M1kb196zaoqj58cWwZvmNZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sharma Bhupesh <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "marc.zyngier-5wv7dgnIgG8@public.gmane.org" <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "Catalin.Marinas-5wv7dgnIgG8@public.gmane.org" <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Singh Jaiprakash <jaiprakash.singh-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "bhupesh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <bhupesh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 5, 2015 at 3:11 AM, Sharma Bhupesh
<bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> From: pku.leo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org [mailto:pku.leo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
>> Sent: Saturday, September 05, 2015 2:43 AM
>> On Fri, Sep 4, 2015 at 3:16 PM, Sharma Bhupesh
>> <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> >> From: pku.leo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org [mailto:pku.leo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
>> >> Sent: Friday, September 04, 2015 10:27 PM On Fri, Sep 4, 2015 at 1:57
>> >> AM, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> >> > This patch adds bindings for QIXIS FPGA controller found on FSL
>> boards.
>> >>
>> >> A general comment: when you are updating the device tree bindings.
>> >> You should cc the devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org mailing list.
>> >>
>> >> >
>> >> > Some Freescale boards like LS2080AQDS/LS2080ARDB have an on-board
>> >> > FPGA/CPLD connected to the IFC controller. The bindings specified
>> >> > in this patch cater to those on-board FPGA/CPLD controllers.
>> >>
>> >> We already have the binding defined in
>> >> Documentation/devicetree/bindings/powerpc/fsl/board.txt.  We probably
>> >> should just move it to a more generic location.
>> >
>> > Consolidation of powerpc and ARM bindings is something that needs to
>> > be targeted by a separate patch-series, perhaps in future.
>> >
>> > There are a number of duplications that can be looked into, but I
>> > don't think this patchset should depend on that.
>>
>> There might be some duplication, but we shouldn't be adding more.  :) I
>> would rather you directly updating that file than creating a new file
>> even though the original one was in a wrong directory.
>>
>
> IMO a PowerPC binding update makes no sense in a ARM machine patchset sent
> on a arm specific mailing list.

So the best approach is to merge the change with the original binding
and put it into a common place.  Although there were a lot of non-arch
specific bindings placed into the arch folder, we should stop adding
more now.

Regards,
Leo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
