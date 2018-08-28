From: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH v6 3/4] venus: firmware: add no TZ boot and shutdown routine
Date: Tue, 28 Aug 2018 14:45:30 +0900
Message-ID: <CAPBb6MX_XR=vfjgnSn3eauW3C-yfu7a9JA3Psnk=0Aej3mtNBg@mail.gmail.com>
References: <1535034528-11590-1-git-send-email-vgarodia@codeaurora.org>
 <1535034528-11590-4-git-send-email-vgarodia@codeaurora.org>
 <CAPBb6MV1jjksgbSaCuUcY_ZbjfGeK-GaQ_+OZ7LWUv4ehA3dGQ@mail.gmail.com>
 <9e9417cf2fccfed4015f6893045e4f7f@codeaurora.org> <CAPBb6MX7EQvXfq_F+8b2FcqROpGY7ud4M6UyttGzoELsw=NJ=Q@mail.gmail.com>
 <002138192bcb3f7e6bf55e090d1b5328@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <002138192bcb3f7e6bf55e090d1b5328@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vgarodia@codeaurora.org
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, robh@kernel.org, mark.rutland@arm.com, Andy Gross <andy.gross@linaro.org>, Arnd Bergmann <arnd@arndb.de>, bjorn.andersson@linaro.org, Linux Media Mailing List <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 27, 2018 at 9:49 PM Vikash Garodia <vgarodia@codeaurora.org> wrote:
>
> On 2018-08-27 08:36, Alexandre Courbot wrote:
> > On Fri, Aug 24, 2018 at 9:26 PM Vikash Garodia
> > <vgarodia@codeaurora.org> wrote:
> >>
> >> Hi Alex,
> >>
> >> On 2018-08-24 13:09, Alexandre Courbot wrote:
> >> > On Thu, Aug 23, 2018 at 11:29 PM Vikash Garodia
> >> > <vgarodia@codeaurora.org> wrote:
> >>
> >> [snip]
> >>
> >> >> +struct video_firmware {
> >> >> +       struct device *dev;
> >> >> +       struct iommu_domain *iommu_domain;
> >> >> +};
> >> >> +
> >> >>  /**
> >> >>   * struct venus_core - holds core parameters valid for all instances
> >> >>   *
> >> >> @@ -98,6 +103,7 @@ struct venus_caps {
> >> >>   * @dev:               convenience struct device pointer
> >> >>   * @dev_dec:   convenience struct device pointer for decoder device
> >> >>   * @dev_enc:   convenience struct device pointer for encoder device
> >> >> + * @fw:                a struct for venus firmware info
> >> >>   * @no_tz:     a flag that suggests presence of trustzone
> >> >>   * @lock:      a lock for this strucure
> >> >>   * @instances: a list_head of all instances
> >> >> @@ -130,6 +136,7 @@ struct venus_core {
> >> >>         struct device *dev;
> >> >>         struct device *dev_dec;
> >> >>         struct device *dev_enc;
> >> >> +       struct video_firmware fw;
> >> >
> >> > Since struct video_firmware is only used here I think you can declare
> >> > it inline, i.e.
> >> >
> >> >     struct {
> >> >         struct device *dev;
> >> >         struct iommu_domain *iommu_domain;
> >> >     } fw;
> >> >
> >> > This structure is actually a good candidate to hold the firmware
> >> > memory area start address and size.
> >>
> >> I can make it inline.
> >> Memory area and size are common parameters populated
> >> locally while loading the firmware with or without tz. Firmware struct
> >> has
> >> info more specific to firmware device.
> >>
> >> [snip]
> >>
> >> >
> >> >> +{
> >> >> +       struct iommu_domain *iommu_dom;
> >> >> +       struct device *dev;
> >> >> +       int ret;
> >> >> +
> >> >> +       dev = core->fw.dev;
> >> >> +       if (!dev)
> >> >> +               return -EPROBE_DEFER;
> >> >> +
> >> >> +       iommu_dom = iommu_domain_alloc(&platform_bus_type);
> >> >> +       if (!iommu_dom) {
> >> >> +               dev_err(dev, "Failed to allocate iommu domain\n");
> >> >> +               return -ENOMEM;
> >> >> +       }
> >> >> +
> >> >> +       ret = iommu_attach_device(iommu_dom, dev);
> >> >> +       if (ret) {
> >> >> +               dev_err(dev, "could not attach device\n");
> >> >> +               goto err_attach;
> >> >> +       }
> >> >
> >> > I think like the above belongs more in venus_firmware_init()
> >> > (introduced in patch 4/4) than here. There is no reason to
> >> > detach/reattach the iommu if we stop the firmware.
> >>
> >> Consider the case when we want to reload the firmware during error
> >> recovery.
> >> Boot and shutdown will be needed in such case without the need to
> >> populate
> >> the firmware device again.
> >
> > Is there a need to reattach the iommu domain in case of an error?
>
> re-attach is not needed. We can have alloc/attach in init and
> detach/free in deinit.
> map/reset and unmap/reset can continue to remain in boot and shutdown
> calls. Let me
> know if this is good, i can repatch the series.

Yeah, the idea is to avoid repeating operations that do not need to be. Thanks!
