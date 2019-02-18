From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v7 0/9] Mellanox BlueField ARM SoC Rshim driver
Date: Mon, 18 Feb 2019 14:24:50 +0100
Message-ID: <CAK8P3a3BEA+oESXONvuVHq5XJ8vne+-4yL78DXux9pXQdybq3Q@mail.gmail.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1548098268-982-1-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548098268-982-1-git-send-email-lsun@mellanox.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Liming Sun <lsun@mellanox.com>
Cc: DTML <devicetree@vger.kernel.org>, David Woods <dwoods@mellanox.com>, arm-soc <arm@kernel.org>, Olof Johansson <olof@lixom.net>, Robin Murphy <robin.murphy@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 8:18 PM Liming Sun <lsun@mellanox.com> wrote:
>
> Liming Sun (9):
>   soc: Add TmFifo driver for Mellanox BlueField Soc
>   arm64: Add Mellanox BlueField SoC config option
>   dt-bindings: soc: Add TmFifo binding for Mellanox BlueField SoC
>   MAINTAINERS: Add entry for Mellanox Bluefield Soc

Could you send the arch/arm64 changes to soc@kernel.org for
inclusion? I'm not sure what the status of the rshim driver is now,
but we should probably merge the base support through the soc
tree.

     Arnd
