From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] ARM64: meson-gxbb-p200: add ADC laddered keys
Date: Mon, 30 Jan 2017 10:50:46 -0800
Message-ID: <m2a8a8tm9l.fsf@baylibre.com>
References: <1484562165-29449-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484562165-29449-1-git-send-email-narmstrong@baylibre.com> (Neil
 Armstrong's message of "Mon, 16 Jan 2017 11:22:45 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: carlo@caione.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Add the 5 buttons connected to a resistor laddered matrix and sampled
> by the SAR ADC channel 0.
>
> Only the p200 board has these buttons, the P201 doesn't.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to v4.11/dt64.

Note that I fixed up the subject prefix to be ARM64: dts:

Kevin
