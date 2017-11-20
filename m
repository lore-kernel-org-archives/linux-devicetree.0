From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/8] dt-bindings: fsi: Add SBEFIFO documentation
Date: Mon, 20 Nov 2017 15:35:47 -0600
Message-ID: <20171120213547.gjqmsiskugnkrqgx@rob-hp-laptop>
References: <1511207217-14075-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1511207217-14075-2-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1511207217-14075-2-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 20, 2017 at 01:46:50PM -0600, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Document the bindings for the SBE CFAM device. SBE devices are
> located on a CFAM off an FSI bus.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  .../devicetree/bindings/fsi/ibm,p9-sbefifo.txt     | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt

Acked-by: Rob Herring <robh@kernel.org>
