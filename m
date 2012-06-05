From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 8/9] ARM: dts: refresh dts file for arch mmp
Date: Tue, 5 Jun 2012 10:03:30 +0800
Message-ID: <CAN1soZx2Gj=ZggFjekTU4CNYeDn40wH2tdGmEDv9W8S32rXRXQ@mail.gmail.com>
References: <1336134626-12262-1-git-send-email-haojian.zhuang@gmail.com>
 <1336134626-12262-9-git-send-email-haojian.zhuang@gmail.com>
 <87d35ezkm1.fsf@laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <87d35ezkm1.fsf-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 5, 2012 at 8:08 AM, Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org> wrote:
> Hi Haojian,
>
> On Fri, May 04 2012, Haojian Zhuang wrote:
>> Append mmp2 and pxa910 dts files. Update PXA168 dts files for irq,
>> timer, gpio components.
>
> The patch I'm replying to introduced a device tree for MMP2/Brownstone
> in 3.5-rc1. =A0We're looking at adopting the MMP2 device tree for the OLPC
> XO-1.75 board, and Mitch Bradley has some corrections to the device tree
> format that we'd like to make, appended below.
>
> You can see all of the files Mitch mentions at:
> http://dev.laptop.org/~wmb/mmp2-devicetree/
>
> Here's my proposal for what to do next:
> =A0* First, you choose one of the two forms that Mitch links to.
> =A0 (Either "mmp2.dtsi" or "mmp2-flat.dtsi"; we have a weak preference
> =A0 for mmp2-flat.dtsi.)
> =A0* Then we'll post patches that modify the arch code to handle the new
> =A0 DT format, and ask for your testing and ACK.
> =A0* We can try to merge the modified .dts files and .c code to 3.5/3.6.
> =A0* We'll work on merging XO-1.75 support into mainline and adding DT
> =A0 support for new devices, too.
>
> What do you think?
>
I think that mmp2-flat.dtsi is better. We can use this. Thanks for your eff=
ort.

Regards
Haojian
> Thanks,
>
> - Chris.
>
