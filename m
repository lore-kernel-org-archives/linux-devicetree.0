From: santosh shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [v4.0: PATCH 0/3] ARM: dts: keystone: dt fixes for netcp driver
Date: Mon, 11 May 2015 12:20:28 -0700
Message-ID: <555100FC.5070901@oracle.com>
References: <1431367530-4924-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431367530-4924-1-git-send-email-m-karicheri2@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Murali Karicheri <m-karicheri2@ti.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ssantosh@kernel.org
List-Id: devicetree@vger.kernel.org

On 5/11/2015 11:05 AM, Murali Karicheri wrote:
> There are few fixes required in the dt bindings for netcp driver to
> make the reg and range sizes to match with data sheet. Also fix the
> typical size error (last bit 1 instead of 0). Please apply this for
> to next branch for v4.2.
>
Applied... It should show up in linux-next soon.

Regards,
Santosh
