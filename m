From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] ARM64: dts: meson-gx: Add missing L2 cache node
Date: Fri, 07 Oct 2016 07:43:48 -0700
Message-ID: <7h7f9kfcd7.fsf@baylibre.com>
References: <1475675630-31514-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1475675630-31514-1-git-send-email-narmstrong@baylibre.com> (Neil
 Armstrong's message of "Wed, 5 Oct 2016 15:53:50 +0200")
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

> In order to remove the boot warning :
> [    2.290933] Unable to detect cache hierarchy from DT for CPU 0
> And add missing L2 cache hierarchy information, add a simple l2 cache node
> and reference it from the A53 cpu nodes.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to v4.10/dt64.

Kevin
