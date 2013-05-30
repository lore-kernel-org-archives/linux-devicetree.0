From: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Subject: Re: [U-Boot] [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Thu, 30 May 2013 09:49:06 +0200
Message-ID: <20130530074906.54BED383069@gemini.denx.de>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <51A51A50.4050308@wwwdotorg.org>
 <CAPnjgZ04BKhQtpJct9tvN8rW5Wae+6fxxOOQDnEkmgrr-mAfwg@mail.gmail.com>
 <51A62F8D.9010208@wwwdotorg.org> <20130529213145.698353831A5@gemini.denx.de>
 <51A67EC1.2000208@wwwdotorg.org> <20130529223621.8B147383069@gemini.denx.de>
 <51A68A4C.4060505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <51A68A4C.4060505-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: u-boot-review <u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Stephen Warren,

In message <51A68A4C.4060505-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> you wrote:
>
> > Sorry, instead we should strive to be compatible to a reasonably old,
> > stable version of DTC, like we do for all other tools as well.  As
> > mentioned before - just because RHEL 5 ships an ancient version of -
> > say - "make" we will NOT start building this from the sources ourself.
> > This cannot be the way to go.
> 
> So the result of that is that we can never ever use new features in any
> tool, at least in any meaningful time-frame.

I wrote "we should strive", not "this is the only way".

> However, when enabling a new feature, such as using device trees to
> configure U-Boot[1], for which tool support is new and evolving along
> with the feature itself, and which is only used on a very very few
> boards and even fewer SoCs right now within U-Boot, it seems entirely
> reasonable to demand that the people working on/with that new feature
> are aware that it's evolving, and that they may need to take a few extra
> steps to go out and get tools that support that new feature. No doubt
> once this feature has settled down a bit, and distros have pulled in
> newer versions of dtc, everthing will "just work" just like any other
> stable feature.

Agreed.  And nothing prevents you to installl on your system another,
more recent version of dtc or any other tools needed for specific
purposes.

> If you don't accept this, then we simply have to ban any include use in
> U-Boot; dtc -i isn't in distro-packaged versions of dtc, so we'd need to

This has never been my intention. I object only against including the
dtc source into U-Boot, and against automatic methods to build dtc as
part of U-Boot, even in a way that depends on the U-Boot version.

dtc is a tool, like gcc or others.  We may test against specific
versions of the tools in the Makefiles, and even abort a build if an
incompatible version is found.  But we will not include tool sources,
nor build / install rules for tools.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org
"Who alone has reason to *lie  himself  out*  of  actuality?  He  who
*suffers* from it."                             - Friedrich Nietzsche
