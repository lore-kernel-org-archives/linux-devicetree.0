From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 21/28] of: remove early_init_dt_setup_initrd_arch
Date: Tue, 17 Sep 2013 22:39:00 -0500
Message-ID: <20130918033900.D66BCC42CAF@trevor.secretlab.ca>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com> <1379372965-22359-22-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379372965-22359-22-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@arm.linux.org.uk>, Mark Salter <msalter@redhat.com>, Aurelien Jacquiot <a-jacquiot@ti.com>, James Hogan <james.hogan@imgtec.com>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Jonas Bonn <jonas@southpole.se>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, 16 Sep 2013 18:09:17 -0500, Rob Herring <robherring2@gmail.com> wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> All arches do essentially the same thing now for
> early_init_dt_setup_initrd_arch, so it can now be removed.
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>

Acked-by: Grant Likely <grant.likely@linaro.org>
