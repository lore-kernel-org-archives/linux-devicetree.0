From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v7 0/3] Qualcomm Resource Power Manager driver
Date: Tue, 23 Sep 2014 21:27:38 -0700
Message-ID: <20140924042737.GQ10179@sonymobile.com>
References: <1411428329-23172-1-git-send-email-bjorn.andersson@sonymobile.com>
 <54212CA0.4030700@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54212CA0.4030700@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Kumar Gala <galak@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Tue 23 Sep 01:17 PDT 2014, Srinivas Kandagatla wrote:

> Hi Bjorn,
> 
> Thankyou for the new patchset.
> 
> I got few device-tree patches for apq8064 usb, sata, phy and hdmi which 
> depend on rpm header file. It will be nice to get this functionality 
> into 3.18.
> 

We should be able to send out the dts patches separate of these.

> Do you think we should take these patches via arm-soc tree?
> 

Both Lee and Mark indicated that they will pull the parts individually. However
both of the patches depend on the header file created in patch 1, someone needs
to take both for it to work out?

Regards,
Bjorn
