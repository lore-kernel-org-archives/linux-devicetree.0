From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL] ARM: SPEAr1310 PCIe updates
Date: Wed, 9 Jul 2014 11:09:08 -0700
Message-ID: <CAOesGMiu_azMYt3L5OgZSFRgrJQvXvkvSOtr0eLam22CQ5SwuA@mail.gmail.com>
References: <2CC2A0A4A178534D93D5159BF3BCB661A17A3E48F2@EAPEX1MAIL1.st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2CC2A0A4A178534D93D5159BF3BCB661A17A3E48F2-8vAmw3ZAcdzhJTuQ9jeba9BPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mohit KUMAR DCG <Mohit.KUMAR-qxv4g6HH51o@public.gmane.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pratyush ANAND <pratyush.anand-qxv4g6HH51o@public.gmane.org>, "'Bjorn Helgaas' (bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org)" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Nicholson <mark-5iakeXVP1y7by3iVrkZq2A@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "FTPAdmin Kernel.org" <ftpadmin-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,



On Tue, Jul 8, 2014 at 10:48 PM, Mohit KUMAR DCG <Mohit.KUMAR-qxv4g6HH51o@public.gmane.org> wrote:
> Hello Olof,
>
> Please pull PCIe updates for ST's SPEAr1310 SoC.
>
> Last version of posted V8 patches have been Acked-by respective maintainers.
> https://lkml.org/lkml/2014/4/15/260
>
> Apart from arch/arm/ changes, it also contains patches for drivers/{pci|phy}.
> Bjorn advised to get complete series via arm-soc tree.
> http://www.spinics.net/lists/linux-pci/msg30271.html
>
>  Regards
>  Mohit
>
> The following changes since commit 4c834452aad01531db949414f94f817a86348d59:
>   Linus Torvalds (1):
>         Linux 3.16-rc3
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git spear/pcie-support-v8
>
> Mohit Kumar (1):
>       SPEAr13xx: defconfig: Update
>
> Pratyush Anand (8):
>       clk: SPEAr13XX: Fix pcie clock name
>       SPEAr13XX: Fix static mapping table
>       phy: SPEAr1310/40-miphy: Add binding information
>       SPEAr: misc: Add binding information
>       phy: SPEAr1310/40-miphy: Add phy driver for PCIe and SATA
>       SPEAr13XX: Add binding information for PCIe controller
>       SPEAr13XX: dts: Add PCIe node information
>       pcie: SPEAr13xx: Add designware wrapper support

There are so many things wrong with this pull request.

* Why is this not coming from the spear maintainer that knows how to
look at patches and deal with these things?
* Why have you separated out the PCIe node info, but not the phy DTS
updates in separate patches?
* Why are you sending a pull request for a repo that is not yours?
* Why is Viresh the git committer but hasn't signed off on the patches?

Are you sharing accounts on kernel.org? (Adding kernel.org admin on cc
just in case).

I'm not going to touch this pull request until the above has been
sorted out and explained.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
