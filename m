From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: net: bcmgenet add property for max
 DMA burst size
Date: Fri, 11 Oct 2019 12:07:58 -0700
Message-ID: <2d4be474-95f1-9ef7-4485-46f7e5565d8c@gmail.com>
References: <20191011184822.866-1-matthias.bgg@kernel.org>
 <20191011184822.866-2-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191011184822.866-2-matthias.bgg@kernel.org>
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
To: matthias.bgg@kernel.org, "David S . Miller" <davem@davemloft.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Stefan Wahren <wahrenst@gmx.net>
List-Id: devicetree@vger.kernel.org

On 10/11/19 11:48 AM, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The maximal usable DMA burst size can vary in different SoCs.
> Add a optional property to configure the DMA channels properly.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>

There are enough differences in the integration of GENET in 2711 (versus
any other STB chip where it has been used) that a brcm,bcm2711-genet-v5
compatible string would be in order. From there, you can derive the DMA
burst size without using additional properties.
-- 
Florian
