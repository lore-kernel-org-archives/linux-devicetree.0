From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson: add g12a x96 max board
Date: Mon, 21 Jan 2019 11:43:46 +0100
Message-ID: <4d1ae3a6-874a-f032-a873-a715a67a3992@baylibre.com>
References: <20181219233519.35287-1-khilman@baylibre.com>
 <20181219233519.35287-2-khilman@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181219233519.35287-2-khilman@baylibre.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

On 20/12/2018 00:35, Kevin Hilman wrote:
> Add the G12a (S905X2) based X96 Max board[1].
> 
> There is no branding for the manufacturer anywhere on the product, so it
> took some digging to find the manufacturer.  But since there's nothing
> about the maker on the product I've left it out of the DT name because
> 1) nobody will know that name and 2) keeps the DT filename shorter.
> 
> [1] https://www.cnx-software.com/2018/09/25/x96-max-amlogic-s905x2-tv-box/
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 28 +++++++++++++++++++

Just found out you forgot to update the Makefile !!

Neil

[snip]

> +
> +&uart_AO {
> +	status = "okay";
> +};
> 
