From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Device tree meeting notes for 10-Dec-2013
Date: Tue, 10 Dec 2013 14:45:11 +0000
Message-ID: <CACxGe6vfRZ6D6hn3RhPO2zaMxVbyNHMjjKxSZuEg_ov-CYhMGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=46rom today's meeting:

Attendees:
Mark Rutland
Rob Herring
Ian Campbell
Stuart Yoder
Tomasz Figa
Grant Likely

Meeting notes:
-----------------------

Action item update
---------------------------------

Stuart: Power.org update - Rob Leshana is head of power.org committee.
Is going to raise the question with the head of power.org. Is in
progress. Need to follow up. Initial impression is that it was
received positively. Stuart will keep us up to date.

Jason: Sent email to list for status

Rob: Prototype script for checking compatible values.

Schema: Still reading patches, deferring discussion to next week.

Other business.
------------------------------
Details of Kernel=92s implementation behaviour:

Mark: Is it worth fixing the i2c devicetree alias mux?
i2c_match_device() needs to be fixed to return NULL if the device
matches against a DT or ACPI match table. SPI has the same problem.
Decision: Yes it should be fixed, Mark to provide patches

Also, Linux currently inherits #address-cells and #size-cells from
parent nodes if a bus node is missing the properties. ePAPR says not
to do this. Do we need to fix Linux?  Grant: The reason of the
behaviour is to work around some PowerPC machines that were missing
properties. Stuart: Was surprised at what ePAPR says; thought the
kernel behaviour was what ePAPR specified. Conclusion: Don=92t feel lik=
e
there is any reason to change this.

Discussion on of_clk_init(). Mark: There are problems where
of_clk_init() users are initializing clocks that are on busses which
are not yet enabled. What do we do about this? As much as possible
need to push clock drivers to be normal platform devices. It does not
make sense to use of_clk_init() unless the clock absolutely needs to
be initialized really early in the boot process (ie. so that the
busses all work). Mark to write some documentation on best practices
for using of_clk_init() and of_intc_init().
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
