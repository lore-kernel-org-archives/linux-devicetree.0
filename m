From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: Add Qualcomm USB Super-Speed PHY bindings
Date: Thu, 20 Dec 2018 12:25:10 -0800
Message-ID: <154533751009.79149.13940391507897650993@swboyd.mtv.corp.google.com>
References: <1544176558-7946-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1544176558-7946-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544176558-7946-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jorge.ramirez-ortiz@linaro.org, kishon@ti.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2018-12-07 01:55:57)
> +
> +- qcom,vdd-voltage-level:
> +    Value type: <prop-array>
> +    Definition: This is a list of three integer values <no min max> where
> +                each value corresponding to voltage corner in uV.

As far as I'm aware, this isn't how qcom's voltage corners are handled
or are going to be handled. Can't you hardcode it in the driver for now?
