From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH] drm/i2c: Add driver for PTN3460 LVDS/DP bridge
Date: Thu, 24 Jan 2013 22:22:00 +0100
Message-ID: <CAKMK7uGQredcS=rqH+m8uDKb72mszOxY6HPjcJpj5g0AwhHvOw@mail.gmail.com>
References: <1359050946-25061-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359050946-25061-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 24, 2013 at 7:09 PM, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> This patch adds the driver for the PTN3460 LVDS/DP bridge chip.
>
> The driver allows the EDID emulation to be selected from device tree,
> along with specifying the GPIOs driving powerdown and reset pins.
>
> The chip has a bug in it such that when the powerdown and reset pins
> are toggled, the hotplug line blips before the bridge is completely
> ready. This forces us to wait for the maximum specified setup time
> (90ms) before interacting with the chip via i2c or doing DP training, as
> opposed to watching the hotplug line. This limitation means that we need
> to synchronize the bridge driver with the DP driver via the
> ptn3460_wait_until_ready function.
>
> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  .../devicetree/bindings/drm/i2c/ptn3460.txt        |   27 ++
>  drivers/gpu/drm/Kconfig                            |    2 +
>  drivers/gpu/drm/i2c/Kconfig                        |    6 +
>  drivers/gpu/drm/i2c/Makefile                       |    2 +
>  drivers/gpu/drm/i2c/ptn3460.c                      |  283 ++++++++++++++++++++

Afaict from reading through the code, this is just a bit of
special-purpose i2c code to control some hw. Imo you can just put that
into your driver directory, since currently all the drivers in drm/i2c
are drm_encoder_slaves (potentially shared between drivers), and I
think we should keep it at that.

Of course, if you plane to extend that to such an encoder slave
driver, then we could move it back.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
