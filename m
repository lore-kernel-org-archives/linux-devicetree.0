From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 0/3] Qualcomm Resource Power Manager driver
Date: Tue, 23 Sep 2014 09:17:36 +0100
Message-ID: <54212CA0.4030700@linaro.org>
References: <1411428329-23172-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411428329-23172-1-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

Thankyou for the new patchset.

I got few device-tree patches for apq8064 usb, sata, phy and hdmi which 
depend on rpm header file. It will be nice to get this functionality 
into 3.18.

Do you think we should take these patches via arm-soc tree?

thanks,
srini

On 23/09/14 00:25, Bjorn Andersson wrote:
> This series adds a regulator driver for the Resource Power Manager found in
> Qualcomm 8660, 8960 and 8064 based devices.
>
> The RPM driver exposes resources to its child devices, that can be accessed to
> implement drivers for the regulators, clocks and bus frequency control that's
> owned by the RPM in these devices.
>
> Changes since v6:
>    - Changed filenames from qcom,rpm.{txt,h} to qcom-rpm.{txt,h}
>
> Changes since v5:
>    - Clarified dt binding
>    - Converted regulator qcom,force-mode to enum instead of multi-boolean
>    - Remove unecessary version handshake
>    - Cleaned up naming of RPM resources between different RPM versions
>    - Updated regulator qcom,force-mode parsing
>    - Updated regulator qcom,power-mode-* parsing
>    - Cleanups in rpm driver
>    - Dropped dev_get_qcom_rpm helper function
>
> Changes since v4:
>    - Moved RPM driver to mfd
>
> Changes since v3:
>    - IPC register is acquired through syscon, as it's shared with others
>
> Changes since v2:
>    - Fix copy-paste error in dt binding
>    - Correct incomplete move from mfd to soc
>    - Correct const mistake in regulator driver
>
> Changes since v1:
>    - Moved rpm driver to drivers/soc
>    - Extracted resource table structs from rpm struct, as per Srinivas request
>    - Dropped mode setting support for the regulators for now. Unsure if we need
>      it and it requires some rework from the codeaurora solution.
>    - Using set_voltage_sel instead of rolling my own "snapping", as per Marks
>      request
>    - Split regulator ops in mV, uV and swtich versions as per Marks request.
>    - Added devicetree property to enable pull down.
>
> Bjorn Andersson (3):
>    mfd: devicetree: bindings: Add Qualcomm RPM DT binding
>    mfd: qcom-rpm: Driver for the Qualcomm RPM
>    regulator: qcom-rpm: Regulator driver for the Qualcomm RPM
>
>   Documentation/devicetree/bindings/mfd/qcom-rpm.txt |  246 ++++++
>   drivers/mfd/Kconfig                                |   14 +
>   drivers/mfd/Makefile                               |    1 +
>   drivers/mfd/qcom_rpm.c                             |  580 ++++++++++++++
>   drivers/regulator/Kconfig                          |   12 +
>   drivers/regulator/Makefile                         |    1 +
>   drivers/regulator/qcom_rpm-regulator.c             |  798 ++++++++++++++++++++
>   include/dt-bindings/mfd/qcom-rpm.h                 |  154 ++++
>   include/linux/mfd/qcom_rpm.h                       |   10 +
>   9 files changed, 1816 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mfd/qcom-rpm.txt
>   create mode 100644 drivers/mfd/qcom_rpm.c
>   create mode 100644 drivers/regulator/qcom_rpm-regulator.c
>   create mode 100644 include/dt-bindings/mfd/qcom-rpm.h
>   create mode 100644 include/linux/mfd/qcom_rpm.h
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
