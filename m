From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: tq: add compatible for i.MX7 boards
Date: Wed, 27 Mar 2019 16:02:46 -0500
Message-ID: <20190327210246.GA14100@bogus>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
 <20190304165630.18225-4-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190304165630.18225-4-bruno.thomsen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: markus.niebel@tq-group.com, devicetree@vger.kernel.org, shawnguo@kernel.org, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 04, 2019 at 05:56:27PM +0100, Bruno Thomsen wrote:
> Add documentation about the following TQ boards:
> - TQMa7S
> - TQMa7D
> - MBa7
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/tq.txt | 35 ++++++++++++++++++++

This too should go in fsl.yaml. Per board vendor files are gone.

Rob
