From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] pcie: qcom: Add support for sdm845 PCIe controller
Date: Thu, 28 Feb 2019 14:39:13 -0600
Message-ID: <CAErSpo6Tp2_bwjM5bmDG8g8KBiK_vMq0=qg86KNk+5q-ziGfSQ@mail.gmail.com>
References: <20190226070125.22318-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226070125.22318-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 26, 2019 at 1:00 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The SDM845 has one Gen2 and one Gen3 controller, add support for these.
>
> Due to lack of hardware only the Gen2 controller has been verified.

Hi Bjorn,

I like your name :)

If you post a v2 for any reason, please update the subject like to:

  PCI: qcom: Add support for sdm845 PCIe controller

That way it matches the existing conventions and "git log --oneline
drivers/pci/controller/dwc/pcie-qcom.c" looks nice.  If there's no
need for a v2, Lorenzo will likely fix that up for you.

Bjorn
