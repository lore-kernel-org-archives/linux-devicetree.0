From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 00/36] Devicetree schema
Date: Thu, 8 Nov 2018 15:32:49 -0600
Message-ID: <CAL_JsqL+7=zB3ze8cPNC1wZHX_FhP6wF9Xvrb_rTDgH90PDXzQ@mail.gmail.com>
References: <CAApg2=QtTWxi6rhC-r971-HXPP2QEP=ZRRwS7nHQjKRMLGct7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAApg2=QtTWxi6rhC-r971-HXPP2QEP=ZRRwS7nHQjKRMLGct7g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: rybczynska@gmail.com
Cc: devicetree@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Grant Likely <glikely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 8, 2018 at 1:54 PM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> Rob,
> The patch set does convert the documentation files. Could you explain
> the workflow of verifying a DTS? From what I can understand we can
> validate YAML devicetrees, and the schema files against the
> meta-schemas, but I see no tool for DTS to YAML conversion in your
> tools. Do you use https://github.com/pantoniou/yamldt ?

No, I'm not using that. dtc supports yaml output now. The kernel copy
of dtc has this support in 4.20. You need libyaml headers installed to
enable the support. The output format is intended only for validation
and could possibly change.

The 'dtbs_check' target will do a dts->dt.yaml pass of all targets in
$(dtb-y) with dtc and then run the .dt.yaml files through the schema
validation.

There's also a presentation here:
https://connect.linaro.org/resources/yvr18/yvr18-404/

Rob
