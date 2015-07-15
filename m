From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: add device tree for ARM SMM-A53x2 on
 LogicTile Express 20MG
Date: Wed, 15 Jul 2015 16:28:54 +0100
Message-ID: <1436974134.32371.112.camel@hellion.org.uk>
References: <1435754163-17929-1-git-send-email-sudeep.holla@arm.com>
		 <1435754163-17929-4-git-send-email-sudeep.holla@arm.com>
	 <1436863074.25044.30.camel@hellion.org.uk> <55A4EEF3.50801@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55A4EEF3.50801-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Kristina Martsenko <Kristina.Martsenko-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-07-14 at 12:13 +0100, Sudeep Holla wrote:
> 
> On 14/07/15 09:37, Ian Campbell wrote:
> > On Wed, 2015-07-01 at 13:36 +0100, Sudeep Holla wrote:
> >
> >> diff --git a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
> >> new file mode 100644
> >> index 000000000000..5b1d0181023b
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
> > [...]
> >> +		/include/ "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi"
> >
> > Unfortunately this causes some issues for the split device tree
> > repository[0], since things get moved around there.
> >
> > This new file ends up at src/arm64/arm/vexpress-v2f-1xv7-ca53x2.dts
> > while the include is at src/arm/vexpress-v2m-rs1.dtsi.
> >
> 
> Ah sorry, wasn't aware of such a effort to move DTS files out.
> 
> > Any ideas how best to deal with this?
> >
> 
> Honestly no idea. We did discuss this internally with 2 options:
> 
> 1. Specifying the relative path as done in this patch
> 2. Creating symlink, something like how kvm manages files today
> 
> I agree both are not elegant but (1) was chosen to be better of the two.
> We are open for any suggestions.

3. Some path for DTSI files which are not specific to a particular
architecture, picked up by dtc by default (via -I in default flags)?

4. DTC_FLAGS += -I../../../../arm/boot/dts in
arch/arm64/boot/dts/Makefile and using #include "vexpress....dtsi", with
the split repo using a different -I in its build system (essentially
codifying the relationship between arm64 and arm in the build system
instead of the code).

IMHO 4 is better than 1 or 3, although still not great. Not sure about 2
myself (from the PoV of working in both contexts).

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
