From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: qcom: add msm8974
 bindings
Date: Fri, 11 Oct 2019 10:29:17 -0500
Message-ID: <20191011152917.GA28441@bogus>
References: <20191005114605.5279-1-masneyb@onstation.org>
 <20191005114605.5279-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191005114605.5279-2-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: bjorn.andersson@linaro.org, georgi.djakov@linaro.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonathan@marek.ca
List-Id: devicetree@vger.kernel.org

On Sat, Oct 05, 2019 at 07:46:04AM -0400, Brian Masney wrote:
> Add device tree bindings for the Qualcomm MSM8974 interconnect providers
> that support setting system bandwidth requirements between various
> network-on-chip fabrics.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Rob: I included in the next patch at the top a rough diagram showing the
> relationship between different buses. I wanted to include that diagram
> here, however I didn't since I assume that this document will be
> transformed into HTML. I've seen some of the text bindings in the IIO
> subsystem have nice ASCII-art diagrams, such as
> Documentation/devicetree/bindings/iio/dac/dpot-dac.txt. Do you have any
> suggestions for how this can go in the YAML bindings? Prefix the line
> with four spaces, similiar to what is done in markdown?

The long term plan (dream?) is to extract schema into rST and there's 
been some experimenting with embedded rST into description which seems 
to work. But I don't see that happening anytime soon really. We've got 
3500 bindings to convert...

So put whatever you like in the description as long as it's parseable 
yaml.

> 
> Changes since v1:
> - Don't include all compatibles in the examples. Removed interconnect
>   GPU client from example as well.
> - Dual license header file: BSD or GPL 2.0
> 
>  .../bindings/interconnect/qcom,msm8974.yaml   |  62 ++++++++
>  .../dt-bindings/interconnect/qcom,msm8974.h   | 146 ++++++++++++++++++
>  2 files changed, 208 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
>  create mode 100644 include/dt-bindings/interconnect/qcom,msm8974.h

Reviewed-by: Rob Herring <robh@kernel.org>
