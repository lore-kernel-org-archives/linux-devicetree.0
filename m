From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 04/20] dt-bindings: mrvl,intc: Add a MMP3 interrupt
 controller
Date: Tue, 27 Aug 2019 17:23:54 -0500
Message-ID: <20190827222354.GA15294@bogus>
References: <20190822092643.593488-1-lkundrak@v3.sk>
 <20190822092643.593488-5-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190822092643.593488-5-lkundrak@v3.sk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Olof Johansson <olof@lixom.net>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 22 Aug 2019 11:26:27 +0200, Lubomir Rintel wrote:
> Similar to MMP2 one, but has an extra range for the other core. The
> muxes stay the same.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v1:
> - Reformat the compatible property documentation to higlight the valid
>   combinations
> - Drop an unneeded mmp3-intc example
> 
>  .../bindings/interrupt-controller/mrvl,intc.txt    | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
