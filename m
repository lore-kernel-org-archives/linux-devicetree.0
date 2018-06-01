From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 1/7] clk: msm8996-gcc: Mark halt check as no-op for USB/PCIE
 pipe_clk
Date: Fri, 01 Jun 2018 11:45:25 -0700
Message-ID: <152787872536.144038.14465736571389918971@swboyd.mtv.corp.google.com>
References: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org>
 <1525295174-15995-2-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525295174-15995-2-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, robh@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, evgreen@chromium.org, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Manu Gautam (2018-05-02 14:06:08)
> The USB and PCIE pipe clocks are sourced from external clocks
> inside the QMP USB/PCIE PHYs. Enabling or disabling of PIPE RCG
> clocks is dependent on PHY initialization sequence hence
> update halt_check to BRANCH_HALT_SKIP for these clocks so
> that clock status bit is not polled when enabling or disabling
> the clocks. It allows to simplify PHY client driver code which
> is both user and source of the pipe_clk and avoid error logging
> related status check on clk_disable/enable.
> =

> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---

Applied to clk-next
