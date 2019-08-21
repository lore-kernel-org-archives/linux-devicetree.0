From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: opp: Introduce opp-peak-kBps and
  opp-avg-kBps bindings
Date: Wed, 21 Aug 2019 15:33:53 -0500
Message-ID: <20190821203353.GA11783@bogus>
References: <20190807223111.230846-1-saravanak@google.com>
 <20190807223111.230846-2-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190807223111.230846-2-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Saravana Kannan <saravanak@google.com>, Georgi Djakov <georgi.djakov@linaro.org>, vincent.guittot@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, sibis@codeaurora.org, bjorn.andersson@linaro.org, evgreen@chromium.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed,  7 Aug 2019 15:31:09 -0700, Saravana Kannan wrote:
> Interconnects often quantify their performance points in terms of
> bandwidth. So, add opp-peak-kBps (required) and opp-avg-kBps (optional) to
> allow specifying Bandwidth OPP tables in DT.
> 
> opp-peak-kBps is a required property that replaces opp-hz for Bandwidth OPP
> tables.
> 
> opp-avg-kBps is an optional property that can be used in Bandwidth OPP
> tables.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  Documentation/devicetree/bindings/opp/opp.txt     | 15 ++++++++++++---
>  .../devicetree/bindings/property-units.txt        |  4 ++++
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
