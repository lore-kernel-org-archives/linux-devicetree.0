From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 5/5] gpio: DT: Rephrase property "gpios" of hog node to
 support multiple gpios
Date: Wed, 9 Mar 2016 10:18:47 -0700
Message-ID: <56E05AF7.2050803@wwwdotorg.org>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
 <1457438528-29054-6-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1457438528-29054-6-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, treding@nvidia.com
List-Id: devicetree@vger.kernel.org

On 03/08/2016 05:02 AM, Laxman Dewangan wrote:
> The property "gpios" of GPIO hog node support the multiple GPIO entries.
> Rephrase the details of this property for this new support.

Oh, I see the document is updated here. I think either patch 4 and 5 
should be swapped so the docs are updated first, or this should be 
squashed into patch 4.
