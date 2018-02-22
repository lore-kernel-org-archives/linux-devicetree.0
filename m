From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND] arm64: dts: cavium: fix PCI bus dtc warnings
Date: Thu, 22 Feb 2018 17:36:28 +0100
Message-ID: <CAK8P3a1MXr7PeyTJKYj0vMuHYeTptYpOkowdqAcY-vZJ6aEEPg@mail.gmail.com>
References: <20180201213240.28862-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180201213240.28862-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 1, 2018 at 10:32 PM, Rob Herring <robh@kernel.org> wrote:
> dtc recently added PCI bus checks. Fix these warnings:
>
> arch/arm64/boot/dts/cavium/thunder2-99xx.dtb: Warning (pci_bridge): Node /pci missing bus-range for PCI bridge
> arch/arm64/boot/dts/cavium/thunder2-99xx.dtb: Warning (unit_address_vs_reg): Node /pci has a reg or ranges property, but no unit name
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Jayachandran C <jnair@caviumnetworks.com>
> ---
> Arnd, Olof,
>
> Going thru my backlog of patches and found this one never made it
> upstream. Please apply.

Applied now, sorry for missing this.

      Arnd
