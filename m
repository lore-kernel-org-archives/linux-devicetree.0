From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] mfd: stmpe: Use devm_*() routines
Date: Tue, 20 Nov 2012 12:11:06 +0530
Message-ID: <CAKohpomX15TJ3gfk+s_18_2WuL2p314gCpv1fKS=AFWhHZJNew@mail.gmail.com>
References: <07672d0597e23fbc580843193415b89e81dba326.1352475033.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <07672d0597e23fbc580843193415b89e81dba326.1352475033.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: devicetree@vger.kernel.org

On 9 November 2012 21:01, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> This patch frees stmpe driver from tension of freeing resources :)
> devm_* derivatives of multiple routines are used while allocating resources,
> which would be freed automatically by kernel.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Ping!!
