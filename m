From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v3 5/5] soc: qcom: cmd-db: Map with read-only mappings
Date: Wed, 18 Sep 2019 12:40:52 -0700
Message-ID: <CAE=gft6=4m79QX8Bca9izRUUkumio_YKBNY8aY=XPjj=WE_BYA@mail.gmail.com>
References: <20190910160903.65694-1-swboyd@chromium.org>
 <20190910160903.65694-6-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190910160903.65694-6-swboyd@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 9:09 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The command DB is read-only already to the kernel because everything is
> const marked once we map it. Let's go one step further and try to map
> the memory as read-only in the page tables. This should make it harder
> for random code to corrupt the database and change the contents.
>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/cmd-db.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> index 10a34d26b753..6365e8260282 100644
> --- a/drivers/soc/qcom/cmd-db.c
> +++ b/drivers/soc/qcom/cmd-db.c
> @@ -240,7 +240,8 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
>  {
>         int ret = 0;
>
> -       cmd_db_header = devm_memremap_reserved_mem(&pdev->dev, MEMREMAP_WB);
> +       cmd_db_header = devm_memremap_reserved_mem(&pdev->dev,
> +                                                  MEMREMAP_RO | MEMREMAP_WB);

It seems weird to have both flags, like: "It's read-only, but if it
ever did get written to somehow, make it writeback".

>         if (IS_ERR(cmd_db_header)) {
>                 ret = PTR_ERR(cmd_db_header);
>                 cmd_db_header = NULL;
> --
> Sent by a computer through tubes
>
