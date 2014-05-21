From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch v4 2/5] Power: reset: add bindings for keystone reset
 driver
Date: Wed, 21 May 2014 18:07:40 +0200
Message-ID: <13696681.6eGQ96hCX4@wuerfel>
References: <1400682454-24535-1-git-send-email-ivan.khoronzhuk@ti.com>
 <5023955.Vhmhn25HgF@wuerfel> <537CCE5A.7030909@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <537CCE5A.7030909@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, linux-doc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, dbaryshkov@gmail.com, rdunlap@infradead.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, m-karicheri2@ti.com, olof@lixom.net, robh+dt@kernel.org, santosh.shilimkar@ti.com, linux-arm-kernel@lists.infradead.org, galak@codeaurora.org, grant.likely@linaro.org, dwmw2@infradead.org, w-kwok2@ti.com
List-Id: devicetree@vger.kernel.org

On Wednesday 21 May 2014 19:03:38 Ivan Khoronzhuk wrote:
> 
> I've slightly confused where should I add these bindings.
> The main pll controller mostly used by clk driver....
> As its register set is used also by reset driver it's logically to put 
> it to bindings/mfd,
> but pll controller in mfd it's strange....
> 
> Could you please help to decide where should it be?.

Put it into Documentation/devicetree/bindings/clock/keystone-pll.txt

	Arnd
