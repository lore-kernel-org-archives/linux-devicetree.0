From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/3] usb: typec: tcpm: charge current handling for
 sink  during hard reset
Date: Fri, 12 Oct 2018 09:48:56 -0500
Message-ID: <20181012144856.GA3720@bogus>
References: <20181001194501.58338-1-badhri@google.com>
 <20181001194501.58338-3-badhri@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181001194501.58338-3-badhri@google.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chanwoo Choi <cw00.choi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Li Jun <jun.li@nxp.com>, linux@roeck-us.net, jackp@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>
List-Id: devicetree@vger.kernel.org

On Mon,  1 Oct 2018 12:45:01 -0700, Badhri Jagan Sridharan wrote:
> During the initial connect to a non-pd port, sink would hard reset
> twice before deeming that the port partner is non-pd. TCPM sets the
> the charge path to false during the hard reset. This causes unnecessary
> connects/disconnects of charge path and makes port take longer to
> charge from the non-pd ports. Avoid this by not setting the charge path
> to false unless the partner has already identified to be pd capable.
> 
> When partner is a pd port, set the charge path to false in
> SNK_HARD_RESET_SINK_OFF. Set the current limits to default value based
> of CC pull up and resume the charge path when port enters
> SNK_HARD_RESET_SINK_ON.
> 
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> 
> --------
> Changes in V3:
> Rebase on top of usb-next
> 
> Changes in V2:
> Based on feedback of jackp@codeaurora.org
> - vsafe_5v_hard_reset flag from tcpc_config is removed
> - Patch only differentiates between pd port partner and non-pd port
> partner
> 
> V1 version of the patch is here:
> https://lkml.org/lkml/2018/9/14/11
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
