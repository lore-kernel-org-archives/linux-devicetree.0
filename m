From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Add Spreadtrum SC27xx PMIC documentation
Date: Tue, 24 Oct 2017 09:35:53 +0800
Message-ID: <CAMz4kuLq=5G9R2bUOVSRqEPLr-Kc0CB8mGa-U1CcRbQvN1NdWA@mail.gmail.com>
References: <1dd82fa9d640d076e88b618c0788d27315a51f66.1508154918.git.baolin.wang@spreadtrum.com>
 <20171023224127.5utbp2t3ihn34mrz@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171023224127.5utbp2t3ihn34mrz@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 24 October 2017 at 06:41, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Oct 16, 2017 at 08:03:14PM +0800, Baolin Wang wrote:
>> This patch adds the binding documentation for Spreadtrum SC27xx series
>> PMIC device.
>>
>> Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>> ---
>> Changes since v1:
>>  - Add more documentation to introduce Spreadtrum SC27xx series PMICs.
>>  - Modify compatile string property.
>>  - Modify reg property.
>>  - Remove redundant 'pmic' label.
>>  - Change 'should be' to 'must be' for cells properties.
>> ---
>>  .../devicetree/bindings/mfd/sprd,sc27xx-pmic.txt   |   40 ++++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks Rob and Lee. Lee, could you apply this patchset into your next
branch? Thanks.

-- 
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
