From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] ARM: dts: da850-lego-ev3: remove unnecessary gpio-keys
 properties
Date: Mon, 14 May 2018 15:34:43 +0530
Message-ID: <95feb477-cd17-54e2-4a99-62a8a5e6f993@ti.com>
References: <20180512214159.22041-1-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180512214159.22041-1-david@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-arm-kernel@lists.infradead.org
Cc: Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sunday 13 May 2018 03:11 AM, David Lechner wrote:
> This removes the #address-cells and #size-cells properties from the
> gpio-keys node in the da850-lego-ev3 device tree. These properties are
> not needed since the child nodes don't have a reg property.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

Applied to v4.18/dt. Its too late to sent W=1 warning fixes for v4.17 cycle.

Thanks,
Sekhar
