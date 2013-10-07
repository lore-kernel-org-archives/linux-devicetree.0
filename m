From: Mark Salter <msalter@redhat.com>
Subject: Re: [PATCH v2 01/29] c6x: use boot_command_line instead of private
 c6x_command_line
Date: Mon, 07 Oct 2013 16:12:29 -0400
Message-ID: <1381176749.17503.62.camel@deneb.redhat.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
	 <1381163377-21044-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381163377-21044-2-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Aurelien Jacquiot <a-jacquiot@ti.com>, linux-c6x-dev@linux-c6x.org
List-Id: devicetree@vger.kernel.org

On Mon, 2013-10-07 at 11:29 -0500, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> Save some pointless copying of the kernel command line and just use
> boot_command_line instead.
> 
> Also remove default_command_line as it is not referenced anywhere, and
> the DT code already handles the default command line.
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Mark Salter <msalter@redhat.com>
> Cc: Aurelien Jacquiot <a-jacquiot@ti.com>
> Cc: linux-c6x-dev@linux-c6x.org
> Reviewed-by: Grant Likely <grant.likely@linaro.org>
> ---
Tested and
Acked-by: Mark Salter <msalter@redhat.com>
