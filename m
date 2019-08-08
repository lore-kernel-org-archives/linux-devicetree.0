From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v7 0/7] Solve postboot supplier cleanup and optimize probe
 ordering
Date: Wed, 7 Aug 2019 19:02:57 -0700
Message-ID: <84338c58-a4e7-a701-4871-f90370d0af49@gmail.com>
References: <20190724001100.133423-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724001100.133423-1-saravanak@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

Hi Saravana,

On 7/23/19 5:10 PM, Saravana Kannan wrote:
> Add device-links to track functional dependencies between devices
> after they are created (but before they are probed) by looking at
> their common DT bindings like clocks, interconnects, etc.
> 

< snip >

I know that this series has moved on to versions 8 and 9.  And some
additional patches submitted.

Version 8 was a rebase to handle device_link changes.  The version 8
patch 0/7 description of the changes did not note any functional
changes, so I am assuming that my comments on version 7 are still
applicable.

The version 9 changes do not impact my comments.

I am sending review comments on patches 1, 2, and 3.  I will continue
review of patches later in the series when the fall out from these
review comments result in a new series.

-Frank
