From: Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH 3/3] [PATCH v2 3/3] usb: typec: tcpm: charge current
 handling for sink during hard reset
Date: Fri, 28 Sep 2018 16:48:18 -0700
Message-ID: <CAPTae5JsW17LUkrkAaT8AGeB=c5=Sv_M5dk0gCahDNkLrGy45g@mail.gmail.com>
References: <20180928234703.15970-1-badhri@google.com> <20180928234703.15970-3-badhri@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180928234703.15970-3-badhri@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, cw00.choi@samsung.com, a.hajda@samsung.com, jun.li@nxp.com, Guenter Roeck <linux@roeck-us.net>, jackp@codeaurora.org
Cc: devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+ jackp@codeaurora.org
On Fri, Sep 28, 2018 at 4:47 PM Badhri Jagan Sridharan
<badhri@google.com> wrote:
>
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
> Changes in V2:
> Based on feedback of jackp@codeaurora.org
> - vsafe_5v_hard_reset flag from tcpc_config is removed
> - Patch only differentiates between pd port partner and non-pd port
> partner
>
> V1 version of the patch is here:
> https://lkml.org/lkml/2018/9/14/11
> ---
>  drivers/usb/typec/tcpm.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
> index c3ac0e46106b4..c25a69922ee6a 100644
> --- a/drivers/usb/typec/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -3273,7 +3273,8 @@ static void run_state_machine(struct tcpm_port *port)
>         case SNK_HARD_RESET_SINK_OFF:
>                 memset(&port->pps_data, 0, sizeof(port->pps_data));
>                 tcpm_set_vconn(port, false);
> -               tcpm_set_charge(port, false);
> +               if (port->pd_capable)
> +                       tcpm_set_charge(port, false);
>                 tcpm_set_roles(port, port->self_powered, TYPEC_SINK,
>                                TYPEC_DEVICE);
>                 /*
> @@ -3305,6 +3306,12 @@ static void run_state_machine(struct tcpm_port *port)
>                  * Similar, dual-mode ports in source mode should transition
>                  * to PE_SNK_Transition_to_default.
>                  */
> +               if (port->pd_capable) {
> +                       tcpm_set_current_limit(port,
> +                                              tcpm_get_current_limit(port),
> +                                              5000);
> +                       tcpm_set_charge(port, true);
> +               }
>                 tcpm_set_attached_state(port, true);
>                 tcpm_set_state(port, SNK_STARTUP, 0);
>                 break;
> --
> 2.19.0.605.g01d371f741-goog
>
