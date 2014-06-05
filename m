From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/3] ARM: dts: Create a cros-ec-keyboard fragment
Date: Thu, 5 Jun 2014 09:12:09 -0700
Message-ID: <CAOesGMh8j4S2E-3xqMuK5OWJfYfOUh0OPvfMEZfrssAwfqRU_g@mail.gmail.com>
References: <1401920421-25729-1-git-send-email-dianders@chromium.org>
	<53909219.6090200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53909219.6090200@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Doug Anderson <dianders@chromium.org>, "arm@kernel.org" <arm@kernel.org>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 5, 2014 at 8:51 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 06/04/2014 04:20 PM, Doug Anderson wrote:
>> All ChromeOS ARM devices that have the standard "CrOS EC" have the
>> same keyboard mapping.  It's silly to include this same definition
>> everywhere.  Let's create a "dtsi" fragment that we can include from
>> many different boards.
>>
>> This fragment is based on what's currently in tegra124-venice2.dts
>
> This series looks fine to me. Given it touches both Tegra and Exynos,
> should it be merged into a topic branch in arm-soc, so that it can be
> pulled into both Tegra/Exynos trees to resolve any conflicts. So,
>
> Acked-by: Stephen Warren <swarren@nvidia.com>
>
> If you want, I'm happy to apply this to a topic branch and send a pull
> request to arm-soc.

Sounds good.


-Olof
