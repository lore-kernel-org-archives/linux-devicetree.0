From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] mfd: dt-bindings: Add rk808 PMIC reset property
Date: Thu, 02 Aug 2018 15:44:18 +0200
Message-ID: <15808668.FuvN5QfznR@phil>
References: <1522334683-22169-1-git-send-email-d.schultz@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522334683-22169-1-git-send-email-d.schultz@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Schultz <d.schultz@phytec.de>
Cc: robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am Donnerstag, 29. März 2018, 16:44:43 CEST schrieb Daniel Schultz:
> Add documentation about a new rk808 devicetree property. This can enable
> the rk805/rk808/rk818 PMIC reset, instead of using soft resets from the
> Control and Reset Module.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>

Is this patch still current?

Normally they go through the relevant subsystem tree but I don't
see Lee Jones <lee.jones@linaro.org> in the list of recipients.

So you might want to resend with him (and Rob's Ack) added?


Heiko
