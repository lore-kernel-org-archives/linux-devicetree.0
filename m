From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] dt: add helper function to read u8 & u16 variables & arrays
Date: Thu, 25 Oct 2012 12:33:56 +0530
Message-ID: <CAKohpom42SCMJ+=TdvAjqT0ibRugJi_gXkLy+49N6ExcRZqxLQ@mail.gmail.com>
References: <425b4bec021bce9a2de49959121907aeede6a0b9.1350064805.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <425b4bec021bce9a2de49959121907aeede6a0b9.1350064805.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rob.herring@calxeda.com, grant.likely@secretlab.ca
Cc: spear-devel@list.st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: devicetree@vger.kernel.org

On 12 October 2012 23:31, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> This adds following helper routines:
> - of_property_read_u8_array()
> - of_property_read_u16_array()
> - of_property_read_u8()
> - of_property_read_u16()
>
> First two actually share most of the code with of_property_read_u32_array(), so
> the common part is taken out into a macro, which can be used by all three
> *_array() routines.

Hi Rob,

Any comment here?

--
viresh
