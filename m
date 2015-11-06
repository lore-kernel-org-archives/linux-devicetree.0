From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH 1/3] devicetree: bindings: Document qcom board compatible
 format
Date: Fri, 6 Nov 2015 14:15:04 -0600
Message-ID: <20151106201504.GA18276@qualcomm.com>
References: <1445894712-14350-1-git-send-email-sboyd@codeaurora.org>
 <1445894712-14350-2-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1445894712-14350-2-git-send-email-sboyd@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 26, 2015 at 02:25:10PM -0700, Stephen Boyd wrote:
> Some qcom based bootloaders identify the dtb blob based on a set
> of device properties like SoC, platform, PMIC, and revisions of
> those components. In downstream kernels, these values are added
> to the different component dtsi files (i.e. pmic dtsi file, SoC
> dtsi file, board dtsi file, etc.) via qcom specific DT
> properties. The dtb files are parsed by a program called dtbTool
> that picks out these properties and creates a table of contents
> binary blob with the property information and some offsets into
> the concatenation of all the dtbs (termed a QCDT image).
> 
> The suggestion is to do this via the board compatible string
> instead, because these qcom specific properties are never used by
> the kernel. Add a document describing the format of the
> compatible string that encodes all this information that's
> currently encoded in the qcom,{msm-id,board-id,pmic-id}
> properties in downstream devicetrees. Future bootloaders may be
> updated to look at the compatible field instead of looking for
> the table of contents image. For non-updateable bootloaders, a
> new dtbTool program will parse the compatible string and generate
> a QCDT image from it.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Looks workable.

Reviewed-by: Andy Gross <agross@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
