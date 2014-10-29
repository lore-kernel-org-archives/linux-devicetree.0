From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: Re: [PATCH v2 2/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
 portal(s)
Date: Wed, 29 Oct 2014 16:26:38 -0500
Message-ID: <54515B8E.50100@Freescale.com>
References: <1414487751-31568-1-git-send-email-Emilian.Medve@Freescale.com>
 <1414487751-31568-3-git-send-email-Emilian.Medve@Freescale.com>
 <044D58B4-690A-4CEA-B2DB-8AF4549D4AE2__43711.2007676207$1414507333$gmane$org@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <044D58B4-690A-4CEA-B2DB-8AF4549D4AE2__43711.2007676207$1414507333$gmane$org@codeaurora.org>
Sender: linux-doc-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Geoff.Thorpe@Freescale.com, corbet@lwn.net, linux-doc@vger.kernel.org, linuxppc-dev@ozlabs.org, grant.likely@linaro.org, robh+dt@kernel.org, scottwood@Freescale.com
List-Id: devicetree@vger.kernel.org

Hello Kumar,


On 10/28/2014 09:41 AM, Kumar Gala wrote:
> On Oct 28, 2014, at 4:15 AM, Emil Medve <Emilian.Medve@freescale.com> wrote:
> 
>> Portals are memory mapped interfaces to BMan that allow low-latency,
>> lock-less interaction by software running on processor cores, accelerators
>> and network interfaces with the BMan
>>
>> Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
>> Change-Id: I6d245ffc14ba3d0e91d403ac7c3b91b75a9e6a95
>> ---
>> .../bindings/powerpc/fsl/bman-portals.txt          | 52 ++++++++++++++++++++++
>> 1 file changed, 52 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
>>
>> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt b/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
> 
> similar comment about location of binding not being PPC specific.

Will move it to Documentation/devicetree/bindings/soc

>> new file mode 100644
>> index 0000000..02e0231
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
>> @@ -0,0 +1,52 @@
>> +QorIQ DPAA Buffer Manager Portals Device Tree Binding
>> +
> 
> Probably worth putting the text from the commit message here as well.

Ok


Cheers,
