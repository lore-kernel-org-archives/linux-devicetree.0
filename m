From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v6 4/4] venus: firmware: register separate platform_device for
 firmware loader
Date: Thu, 23 Aug 2018 23:45:13 -0700
Message-ID: <153509311396.28926.9155836717358532427@swboyd.mtv.corp.google.com>
References: <1535034528-11590-1-git-send-email-vgarodia@codeaurora.org>
 <1535034528-11590-5-git-send-email-vgarodia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535034528-11590-5-git-send-email-vgarodia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org, hverkuil@xs4all.nl, mark.rutland@arm.com, mchehab@kernel.org, robh@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, acourbot@chromium.org, vgarodia@codeaurora.org
List-Id: devicetree@vger.kernel.org

Quoting Vikash Garodia (2018-08-23 07:28:48)
> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> =

> This registers a firmware platform_device and associate it with
> video-firmware DT subnode. Then calls dma configure to initialize
> dma and iommu.

Yes, but why? Commit text isn't supposed to say what is obvious from the
code.
