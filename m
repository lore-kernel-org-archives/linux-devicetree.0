From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 1/3] usb: chipidea: msm: Add device tree binding information
Date: Tue, 22 Apr 2014 16:07:57 +0100
Message-ID: <535685CD.9080207@linaro.org>
References: <1398159797-26917-1-git-send-email-iivanov@mm-sol.com> <1398159797-26917-2-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1398159797-26917-2-git-send-email-iivanov@mm-sol.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Peter Chen <Peter.Chen@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 22/04/14 10:43, Ivan T. Ivanov wrote:
> +- interrupts:   interrupt-specifier for the controller interrupt.
> +- usb-phy:      phandle for the PHY device
> +- dr_mode:      Sould be "peripheral"
s/Sould/Should/
> +
