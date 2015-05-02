From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: Invitation and RFC: Linux Plumbers Device Tree
 track proposed
Date: Sat, 2 May 2015 09:51:37 +0200
Message-ID: <CAMuHMdXJ7ggN-eaUKzjDz-gTGBOaU6orq+nVM3joExgPDu6UEA@mail.gmail.com>
References: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E@SELDMBX99.corpusers.net>
	<5543EE80.5060109@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <celinux-dev-bounces-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>
In-Reply-To: <5543EE80.5060109-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
List-Unsubscribe: <https://lists.celinuxforum.org/mailman/options/celinux-dev>,
	<mailto:celinux-dev-request-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.celinuxforum.org/pipermail/celinux-dev/>
List-Post: <mailto:celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>
List-Help: <mailto:celinux-dev-request-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org?subject=help>
List-Subscribe: <https://lists.celinuxforum.org/mailman/listinfo/celinux-dev>,
	<mailto:celinux-dev-request-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org?subject=subscribe>
Sender: celinux-dev-bounces-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org
Errors-To: celinux-dev-bounces-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rowand, Frank" <Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org" <celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Fri, May 1, 2015 at 11:22 PM, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> wrote:
> The archive in 1) should have subdirectories for architectures, with the
> same name as the corresponding kernel arch directory. It would be nice
> if there was some sort of dts_defconfig that built a vmlinux that
> statically linked in all the drivers with a device tree binding. It

"Generating .config from DTS"
https://groups.google.com/forum/#!topic/linux.kernel/xYrKolsgr0Y

In the mean time, partial mathing (for i2c/spi devices) has been implemented.

https://github.com/geertu/linux-scripts/blob/master/linux-config-from-dt

It needs more work to generate a full .config, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
