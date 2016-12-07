From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v2] ARM: dts: lpc32xx: add pwm-cells to base dts file
Date: Thu, 8 Dec 2016 00:50:48 +0200
Message-ID: <3cbc7c24-0a0a-d8a0-ebdb-722cf9d2eb02@mleia.com>
References: <1481139047-13166-1-git-send-email-slemieux.tyco@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1481139047-13166-1-git-send-email-slemieux.tyco@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylvain Lemieux <slemieux.tyco@gmail.com>, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Sylvain,

On 12/07/2016 09:30 PM, Sylvain Lemieux wrote:
> From: Sylvain Lemieux <slemieux@tycoint.com>
> 
> There is no need to define the "pwm-cells" in the board
> specific dts file; move the entry to the base dts file.
> 
> Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> ---

thank you for the change,

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
With best wishes,
Vladimir
