From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v8 09/42] dt-bindings: clock: New bindings for TI Davinci PSC
Date: Tue, 20 Mar 2018 10:03:57 -0700
Message-ID: <152156543724.183971.9703906314447360197@swboyd.mtv.corp.google.com>
References: <1521168778-27236-1-git-send-email-david@lechnology.com>
 <1521168778-27236-10-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521168778-27236-10-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting David Lechner (2018-03-15 19:52:25)
> This adds a new binding for the Power Sleep Controller (PSC) for the
> mach-davinci family of processors.
> 
> Note: Although TI Keystone has a very similar PSC, we are not using the
> existing bindings. Keystone is using a legacy one-node-per-clock binding
> (actually two nodes if you count the separate reset binding for the same
> IP block). Also, some davinci LPSCs have quirks that aren't handled by
> the keystone bindings, so we would be adding one compatible string per
> clock with quirks instead of just a new compatible string for each
> controller.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
