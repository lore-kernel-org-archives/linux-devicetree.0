From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 0/5] Fix Cygnus, NS2, Stingray interrupt type
Date: Mon, 18 Jun 2018 09:48:18 -0700
Message-ID: <ac955f7d-6770-63a1-db85-024b0ee0b8af@gmail.com>
References: <1528834891-17807-1-git-send-email-ray.jui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528834891-17807-1-git-send-email-ray.jui@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>, linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 06/12/2018 01:21 PM, Ray Jui wrote:
> This patch series fixes incorrect interrupt types for I2C and PCIe in DT
> for Broadcom Cygnus, NS2, and Stingray SoCs
> 
> This patch series is based off v4.17 and is available on GIHUB:
> repo: https://github.com/Broadcom/arm64-linux.git
> branch: cygnus-ns2-dt-irq-type-fix-v1

Series applied to:

- 1&2: devicetree/fixes
- 3-5: devicetree-arm64/fixes

Thanks Ray.
-- 
Florian
