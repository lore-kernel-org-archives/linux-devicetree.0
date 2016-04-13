From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: Applied "regulator: max8973: add support for junction thermal
 warning" to the regulator tree
Date: Wed, 13 Apr 2016 22:31:03 +0530
Message-ID: <570E7B4F.8060507@nvidia.com>
References: <E1aqNXw-00083K-Oj@debutante>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <E1aqNXw-00083K-Oj@debutante>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: robh+dt@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wednesday 13 April 2016 09:51 PM, Mark Brown wrote:
> The patch
>
>     regulator: max8973: add support for junction thermal warning
>
> has been applied to the regulator tree at
>
>     git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>
>  From d2d5437bdfdde20a75bdf59db1c1a77721613b22 Mon Sep 17 00:00:00 2001
> From: Laxman Dewangan <ldewangan@nvidia.com>
> Date: Wed, 13 Apr 2016 15:29:45 +0530
> Subject: [PATCH] regulator: max8973: add support for junction thermal warning
>

Thank you very much for accepting patch. Hope at this time, it will pass 
the build test robot.
Unfortunately, it was reverted 2 times due to build issue on random config.
