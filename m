From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v9 4/6] Documentation: DT: PL011: hi6220: add compatible
 string for Hisilicon designed UART
Date: Tue, 2 Jun 2015 10:43:06 +0100
Message-ID: <20150602094305.GA2067@n2100.arm.linux.org.uk>
References: <1432950661-23060-1-git-send-email-bintian.wang@huawei.com>
 <1432950661-23060-5-git-send-email-bintian.wang@huawei.com>
 <CACRpkdav_5x6RC9F++ErvqGyxDCF-=kap7-jCsO4zZ6QGVLfBQ@mail.gmail.com>
 <556D73B6.4090608@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <556D73B6.4090608-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "wangbintian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <wangbintian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, XinWei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 02, 2015 at 10:13:26AM +0100, Marc Zyngier wrote:
> That feels weird. This amba_vendor enum is not under control of the DT
> author, nor the kernel. This is a set of codes that are managed by a
> third party (probably ARM). What if some company with a name starting
> with 'H' (Hilarious Inc?) comes up with some actual HW and ends up
> conflicting with the above?

Presumably, HiSilicon have their own vendor code already, which
presumably would be required for them to have a license to modify
ARM IP.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
