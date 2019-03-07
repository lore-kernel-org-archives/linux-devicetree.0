From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v1 0/2] Enable Bluetooth functionality for wcn3998.
Date: Thu, 7 Mar 2019 11:18:40 -0800
Message-ID: <20190307191840.GC138592@google.com>
References: <1551961012-23898-1-git-send-email-c-hbandi@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551961012-23898-1-git-send-email-c-hbandi@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Harish Bandi <c-hbandi@codeaurora.org>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

+ device tree folks

On Thu, Mar 07, 2019 at 05:46:50PM +0530, Harish Bandi wrote:
> This patch series we add support for wcn3998 BT chip set. This new chipset
> is based from the wcn3990 with minimal power numbers. So here in this patch
> The major difference between wcn3990 and wcn3998 is only power numbers. where
> as init process and fw download is same with wcn3990.So we are leveraging the 
> existing code of wcn3990 along with readiing the voltages from the dts file. 

About how many different variants are we talking?

Couldn't you just use a different compatible string for each variant
and specify the voltage/current limits in the hci_qca.c driver, as
currently done for the WCN3990? I understand that it requires touching
the driver for each new variant, but it might be preferable to specify
these static values in a single location, instead of repeating them in
the DT snippets of every device that uses such a controller, with the
possiblity of configuration errors.

The DT folks can probably provide guidance on what is typically done
in cases like this.

Thanks

Matthias
