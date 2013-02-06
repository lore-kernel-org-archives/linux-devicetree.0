From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: moving dt binding documents for video devices to
 common place
Date: Wed, 06 Feb 2013 15:50:15 +0100
Message-ID: <51126DA7.2040309@samsung.com>
References: <1360162668-29677-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1360162668-29677-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Rahul,

On 02/06/2013 03:57 PM, Rahul Sharma wrote:
> Binding Documents for drm-devices are placed in
> Documentation/devicetree/bindings/drm/*. But these devices are common
> for v4l framework, hence moved to a common place
> Documentation/devicetree/bindings/video/. 'exynos_' prefix is added to
> associate them with exynos soc series.

It looks good to me, I would just use 'exynos-' prefix instead,
this seems to be more common across existing files. Sorry for
the nitpicking..

I suppose you should address the patch to and base on the tree of
the device tree maintainers.

Thanks,
Sylwester
