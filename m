From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH V3] ARM: dts: da850-evm: add WP and CD to MMC
Date: Mon, 14 May 2018 16:22:02 +0530
Message-ID: <31cccaa0-21ea-3c03-dbc5-117f7b81e4e5@ti.com>
References: <20180512122358.17459-1-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180512122358.17459-1-aford173@gmail.com>
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
To: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, khilman@kernel.org
List-Id: devicetree@vger.kernel.org

On Saturday 12 May 2018 05:53 PM, Adam Ford wrote:
> The legacy mode uses the write protect and card detect but DT does not.
> This patch enables Write-Protect and Card-Detect pins for the MMC card, and
> the gpio-ranges property sets the gpio pinmuxing for those respective pins.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied to v4.18/dt.

Thanks,
Sekhar
