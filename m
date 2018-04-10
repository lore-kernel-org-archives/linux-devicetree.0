Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <b70afd25fc48ad4d677e4e53951f2138cd34b85e.1523351100.git.viresh.kumar@linaro.org>
References: <b70afd25fc48ad4d677e4e53951f2138cd34b85e.1523351100.git.viresh.kumar@linaro.org>
Message-ID: <152338444966.180276.17472609064497290233@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] of: Don't create platform device for OPP tables
Date: Tue, 10 Apr 2018 11:20:49 -0700
To: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Quoting Viresh Kumar (2018-04-10 02:05:22)
> The OPP tables are present as separate nodes, whose phandle is used in
> the "operating-points-v2" property of devices. Currently the OF core
> creates a platform device for the OPP table unconditionally, which is
> not used by any kernel code.
> =

> Skip creating OPP table platform devices.
> =

> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
