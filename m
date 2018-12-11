From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/6] misc: dt-bindings: Add Qualcomm Fastrpc bindings
Date: Mon, 10 Dec 2018 16:10:50 -0800
Message-ID: <20181211001050.GA1578@tuxbook-pro>
References: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
 <20181207163513.16412-2-srinivas.kandagatla@linaro.org>
 <20181207182327.64mtkfx6v4wlwccz@lakrids.cambridge.arm.com>
 <afdeecc4-4ee9-e933-9917-9930ece85b00@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <afdeecc4-4ee9-e933-9917-9930ece85b00@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, robh+dt@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org

On Mon 10 Dec 03:17 PST 2018, Srinivas Kandagatla wrote:
> On 07/12/18 18:23, Mark Rutland wrote:
> > On Fri, Dec 07, 2018 at 04:35:08PM +0000, Srinivas Kandagatla wrote:
> > > diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
[..]
> > > +- reg
> > > +	Usage: required
> > > +	Value type: <u32>
> > > +	Definition: DSP Processor ID.
> > > +	Possible values are :
> > > +			0 - ADSP
> > > +			1 - MDSP
> > > +			2 - SDSP
> > > +			3 - CDSP
> > 
> > Why is this in a reg?
> 
> This is to identify which type of dsp(Audio/Modem/Sensor/Compute) it is,
> This information is used to create device nodes for user-space access.
> 

But it does not represent FastRPC's address on the rpmsg bus. How about
replacing it with a "label" (or "qcom,domain" perhaps?) of type string?

Regards,
Bjorn
